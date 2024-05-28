import { Component, signal } from '@angular/core';
import { ApiService } from '../../../core/services/api.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Offer } from '../../../core/models/Offer';
import { response } from '../../../core/models/response';
import { firstValueFrom } from 'rxjs';
import { dateTimestampProvider } from 'rxjs/internal/scheduler/dateTimestampProvider';
import { CommonModule } from '@angular/common';
import { JwtService } from '../../../core/services/jwt.service';

@Component({
  selector: 'app-jobdes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './jobdes.component.html',
  styleUrl: './jobdes.component.scss'
})
export class JobdesEmployeeComponent {
  response!: response

  alertError: boolean = false
  alertSuccess: boolean = false

  token: string = localStorage.getItem('tokenEmpleando')!

  arrOffer = signal<Offer>({
    idOffer: 0,
    idUser: 0,
    title: '',
    description: '',
    location: '',
    typeContract: '',
    salary: '',
    expirationDate: new Date(),
    createDate: new Date(),
    modifyDate: new Date(),
    company: ''
  })
  arrHab = signal<any>([])


  constructor(private services: ApiService, private jwtServices: JwtService, private activateRoute: ActivatedRoute, private router: Router) {
  }

  async ngOnInit() {
    this.activateRoute.params.subscribe(async params => {
      this.response = await firstValueFrom(this.services.EmpleoDetalle(params['id']))

      this.arrOffer.set(this.response.respuesta.offer)
      this.arrHab.set(this.response.respuesta.habilidades)

    })
  }

  habilitaAplicar() {
    return !this.jwtServices.isTokenExpired(this.token);
  }


  async Apicar() {
    this.alertSuccess = false;
    this.alertError = false;

    if (!this.jwtServices.isTokenExpired(this.token)) {
      this.activateRoute.params.subscribe(async params => {
        this.response = await firstValueFrom(this.services.Aplicar(params['id']))

        if (this.response.respuesta != "Error") {
          this.alertSuccess = true;
        } else {
          this.alertError = true;
        }
      })
    } else {
      this.router.navigate(['/login']);
    }

  }
}
