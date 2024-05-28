import { Component } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from '@angular/router';
import { response } from '../../../core/models/response';
import { firstValueFrom } from 'rxjs';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterLink],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent {
  response!: response
  loginFrom: FormGroup
  alertSuccess: boolean = false
  alertError: boolean = false
  rol: string = '0'

  constructor(private services: ApiService, private jwtServices: JwtService, private router: Router) {
    this.loginFrom = new FormGroup({
      email: new FormControl("", [Validators.required, Validators.email]),
      password: new FormControl("", [Validators.required])
    });
  }

  async onSubmit() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.loginFrom.valid) {
      const formData = this.loginFrom.value;
      this.response = await firstValueFrom(this.services.InicioSesion(formData))

      if (this.response.respuesta != "Error") {

        localStorage.setItem('tokenEmpleando', this.response.respuesta)
        this.rol = this.jwtServices.rol(this.response.respuesta);
        this.alertSuccess = true;

        if (this.rol == "1") {
          this.router.navigate(['/companies/home']);
        } else {
          this.router.navigate(['/employee/home']);
        }

      } else {
        this.alertError = true;
      }
    } else {
      this.alertError = true;
    }
  }
}
