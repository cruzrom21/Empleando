import { Component } from '@angular/core';
import { AbstractControl, FormControl, FormGroup, ReactiveFormsModule, ValidatorFn, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ApiService } from '../../../core/services/api.service';
import { firstValueFrom } from 'rxjs';
import { response } from '../../../core/models/response';
import { Router } from '@angular/router';
import { JwtService } from '../../../core/services/jwt.service';


@Component({
  selector: 'app-register',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent {
  response!: response
  userFrom: FormGroup
  alertSuccess: boolean = false
  alertError: boolean = false
  rol: string = '0'

  constructor(private services: ApiService, private jwtServices: JwtService, private router: Router) {
    this.userFrom = new FormGroup({
      IdTypeUser: new FormControl("", [Validators.required]),
      email: new FormControl("", [Validators.required, Validators.email]),
      password: new FormControl("", [Validators.required, this.passwordValidator()]),
      repassword: new FormControl("", [Validators.required]),
    }, { validators: this.passwordMatch('password', 'repassword') });
  }


  async onSubmit() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.userFrom.valid) {

      const formData = this.userFrom.value;
      this.response = await firstValueFrom(this.services.Register(formData))

      if (this.response.respuesta != "Error") {

        localStorage.setItem('tokenEmpleando', this.response.respuesta)
        this.rol = this.jwtServices.rol(this.response.respuesta);
        console.log(this.rol)
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








  passwordValidator() {
    return (control: AbstractControl): { [key: string]: any } | null => {
      const value: string = control.value;

      // Validar longitud mínima
      if (value.length < 8) {
        return { 'minLength': true };
      }

      // Validar caracteres especiales
      const specialCharacters = /[!@#$%^&*(),.?":{}|<>]/;
      if (!specialCharacters.test(value)) {
        return { 'specialCharacters': true };
      }

      // Validar letras mayúsculas y minúsculas
      const uppercaseLetters = /[A-Z]/;
      const lowercaseLetters = /[a-z]/;
      if (!uppercaseLetters.test(value) || !lowercaseLetters.test(value)) {
        return { 'uppercaseLowercase': true };
      }

      // Validar números
      const numbers = /[0-9]/;
      if (!numbers.test(value)) {
        return { 'numbers': true };
      }

      return null; // La contraseña es válida
    };
  }


  passwordMatch(passwordKey: string, confirmPasswordKey: string): ValidatorFn {
    return (group: AbstractControl): { [key: string]: any } | null => {
      const password = group.get(passwordKey)?.value;
      const confirmPassword = group.get(confirmPasswordKey)?.value;

      if (password !== confirmPassword) {
        return { 'passwordMismatch': true };
      }

      return null; // Las contraseñas coinciden
    };

  }

}
