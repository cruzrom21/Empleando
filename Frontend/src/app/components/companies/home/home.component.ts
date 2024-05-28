import { CommonModule } from '@angular/common';
import { Component, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { response } from '../../../core/models/response';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  response!: response
  responseData!: response
  alertError: boolean = false

  token: string = localStorage.getItem('tokenEmpleando')!

  arrCan = signal<any>([])

  constructor(private services: ApiService, private jwtServices: JwtService, private router: Router) {
  }

  async ngOnInit() {
    this.alertError = false;

    if (!this.jwtServices.isTokenExpired(this.token)) {

      this.response = await firstValueFrom(this.services.CandidatosRecomendados())

      if (this.response.respuesta != "Error") {
        
        const groupedData = this.response.respuesta.reduce((acc: { [x: string]: { [x: string]: any; }; }, item: { idUser: any; type: any; value: any; }) => {
          const { idUser, type, value } = item;

          if (!acc[idUser]) {
            acc[idUser] = { idUser, Nombre: '?', Ubicacion: '?', Telefono: '?' };
          }

          acc[idUser][type.trim()] = value;
          return acc;
        }, {});

        this.arrCan.set(Object.values(groupedData).slice(0, 3));

      } else {
        this.alertError = true;
      }
    } else {
      this.router.navigate(['/login']);
    }


    this.responseData = await firstValueFrom(this.services.TieneData())



  }

  Buscar(clave: string) {
    if (clave.trim() && clave !== '') {
      this.router.navigate(['/companies/candidate/', clave]);
    }
  }
}
