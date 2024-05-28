import { Component, signal } from '@angular/core';
import { response } from '../../../core/models/response';
import { Offer } from '../../../core/models/Offer';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-offer-des',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './offer-des.component.html',
  styleUrl: './offer-des.component.scss'
})
export class OfferDesComponent {
  response!: response
  responseInit!: response

  alertError: boolean = false
  alertSuccess: boolean = false
  alertCan: boolean = false  

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
  arrCan = signal<any>([])
  arrHab = signal<any>([])

  constructor(private services: ApiService, private jwtServices: JwtService, private activateRoute: ActivatedRoute, private router: Router) {
  }

  async ngOnInit() {
    if (!this.jwtServices.isTokenExpired(this.token)) {
      this.activateRoute.params.subscribe(async params => {

        this.alertError = false;
        this.alertCan = false;

        this.responseInit = await firstValueFrom(this.services.ListarCandidatos(params['id']))

        if (this.responseInit.respuesta != "Error") {         

          if (this.responseInit.respuesta == "SinCanditatos") {
            this.alertCan = true;
          } else {
            const groupedData = this.responseInit.respuesta.reduce((acc: { [x: string]: { [x: string]: any; }; }, item: { idUser: any; type: any; value: any; }) => {
              const { idUser, type, value } = item;

              if (!acc[idUser]) {
                acc[idUser] = { idUser, Nombre: '?', Ubicacion: '?', Telefono: '?' };
              }

              acc[idUser][type.trim()] = value;
              return acc;
            }, {});

            this.arrCan.set(Object.values(groupedData));
          }
        } else {
          this.alertError = true;
        }

        this.responseInit = await firstValueFrom(this.services.EmpleoDetalle(params['id']))

        console.log( this.responseInit)

        this.arrOffer.set(this.responseInit.respuesta.offer)
        this.arrHab.set(this.responseInit.respuesta.habilidades)
      })
    } else {
      this.router.navigate(['/login']);
    }
  }


  habilitaAplicar() {
    return !this.jwtServices.isTokenExpired(this.token);
  }


  async Eliminar() {
    this.alertSuccess = false;
    this.alertError = false;

    if (!this.jwtServices.isTokenExpired(this.token)) {
      this.activateRoute.params.subscribe(async params => {
        this.response = await firstValueFrom(this.services.EliminarOferta(params['id']))

        if (this.response.respuesta != "Error") {
          this.alertSuccess = true;
          this.router.navigate(['/companies/offers']);
          
        } else {
          this.alertError = true;
        }
      })
    } else {
      this.router.navigate(['/login']);
    }

  }
}
