import { CommonModule } from '@angular/common';
import { Component, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { ApiService } from '../../../core/services/api.service';
import { response } from '../../../core/models/response';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-profilecan',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profilecan.component.html',
  styleUrl: './profilecan.component.scss'
})
export class ProfilecanComponent {
  response!: response
  name!: any

  alertSuccess: boolean = false
  alertError: boolean = false

  arrInfo = signal<any>([])
  arrEx = signal<any>([])
  arrEdu = signal<any>([])
  arrHab = signal<any>([])

  constructor(private services: ApiService, private activateRoute: ActivatedRoute) {

  }

  async ngOnInit() {
    await this.informacion()
  }

  async informacion() {
    this.activateRoute.params.subscribe(async params => {
      this.response = await firstValueFrom(this.services.InformacionCandidato(params['id']))

      if (this.response.respuesta != "Error") {
        this.name = this.response.respuesta.data.filter((object: { [x: string]: string; }) => {
          return object['type'] == "Nombre";
        })[0].value;

        this.arrInfo.set(this.response.respuesta.data.filter((object: { [x: string]: string; }) => {
          return object['type'] != "Nombre";
        }))

        this.arrEx.set(this.response.respuesta.experiences)
        this.arrEdu.set(this.response.respuesta.educations)
        this.arrHab.set(this.response.respuesta.habilidades)

      } else {
        this.alertError = true
      }
    })
  }
}
