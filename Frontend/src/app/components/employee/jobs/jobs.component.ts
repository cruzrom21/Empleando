import { Component, signal } from '@angular/core';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Offer } from '../../../core/models/Offer';
import { response } from '../../../core/models/response';
import { firstValueFrom } from 'rxjs/internal/firstValueFrom';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-jobs',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './jobs.component.html',
  styleUrl: './jobs.component.scss'
})
export class JobsEmployeeComponent {
  response!: response
  alertError: boolean = false
  token: string = localStorage.getItem('tokenEmpleando')!
  arrOffer = signal<Offer[]>([])

  constructor(private services: ApiService, private jwtServices: JwtService, private activateRoute: ActivatedRoute, private router: Router) {
  }
  
  ngOnInit() {
    this.activateRoute.params.subscribe(async params => {
      await this.Buscar(params['clave'])
    })
  }

  async Buscar(clave: string){
    this.alertError = false;

    this.response = await firstValueFrom(this.services.Buscar(clave))

    if (this.response.respuesta != "Error") {
      this.arrOffer.set(this.response.respuesta)
     
    } else {
      this.alertError = true
    }
    
  }
}
