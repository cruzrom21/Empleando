import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { response } from '../../../core/models/response';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.scss'
})
export class MenuComponent {
  response!: response
  token: string = localStorage.getItem('tokenEmpleando')!
  rol: string = '0'

  constructor(private services: ApiService, private jwtServices: JwtService, private activateRoute: ActivatedRoute, private router: Router) {
  }
  
  async ngOnInit() {
    if(this.token != null){
      this.rol = this.jwtServices.rol(this.token);
    } else {
      this.rol = '0'
    }

    this.response = await firstValueFrom(this.services.Menu())
  }

  CerrarSesion() {
    localStorage.removeItem('tokenEmpleando')
    this.router.navigate(['/']);
  }
  
}
