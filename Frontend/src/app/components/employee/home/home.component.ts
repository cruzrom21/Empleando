import { Component, signal } from '@angular/core';
import { ApiService } from '../../../core/services/api.service';
import { Router, RouterLink } from '@angular/router';
import { response } from '../../../core/models/response';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';
import { Offer } from '../../../core/models/Offer';
import { JwtService } from '../../../core/services/jwt.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeEmployeeComponent {
  response!: response
  responseData!: response

  alertError: boolean = false

  token: string = localStorage.getItem('tokenEmpleando')!

  tieneData: string = ""
  
  arrOffer = signal<Offer[]>([])

  constructor(private services: ApiService, private jwtServices: JwtService, private router: Router) {
  }

  async ngOnInit () {
    this.alertError = false;

    if (!this.jwtServices.isTokenExpired(this.token)) {
      this.response = await firstValueFrom(this.services.ListarEmpleosSesion())     
    } else {
      this.response = await firstValueFrom(this.services.ListarEmpleos())
    }


    if (this.response.respuesta != "Error") {
      this.arrOffer.set(this.response.respuesta)
    } else {
      this.alertError = true;
    }

    if (!this.jwtServices.isTokenExpired(this.token)) {
      this.responseData = await firstValueFrom(this.services.TieneData()) 
      this.tieneData = this.responseData.respuesta
    }
    
  }

  Buscar(clave: string) {
    if (clave.trim() && clave !== '') {
      this.router.navigate(['employee/jobs/', clave]);
    }
  }


}
