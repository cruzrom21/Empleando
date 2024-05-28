import { Component, signal } from '@angular/core';
import { response } from '../../../core/models/response';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-candidate',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './candidate.component.html',
  styleUrl: './candidate.component.scss'
})
export class CandidateComponent {
  response!: response
  alertError: boolean = false
  token: string = localStorage.getItem('tokenEmpleando')!
  arrCan = signal<any>([])

  constructor(private services: ApiService, private jwtServices: JwtService, private activateRoute: ActivatedRoute, private router: Router) {
  }
  
  ngOnInit() {
    this.activateRoute.params.subscribe(async params => {
      await this.Buscar(params['clave'])
    })
  }

  async Buscar(clave: string){
    this.alertError = false;

    this.response = await firstValueFrom(this.services.BuscarCandidato(clave))

    if (this.response.respuesta != "Error") {

      console.log(this.response.respuesta)


      const groupedData = this.response.respuesta.reduce((acc: { [x: string]: { [x: string]: any; }; }, item: { idUser: any; type: any; value: any; }) => {
        const { idUser, type, value } = item;

        if (!acc[idUser]) {
          acc[idUser] = { idUser, Nombre: '?', Ubicacion: '?', Telefono: '?' };
        }

        acc[idUser][type.trim()] = value;
        return acc;
      }, {});

      this.arrCan.set(Object.values(groupedData));
     
    } else {
      this.alertError = true
    }
    
  }
}
