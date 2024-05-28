import { Component, signal } from '@angular/core';
import { ApiService } from '../../../core/services/api.service';
import { Router } from '@angular/router';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { response } from '../../../core/models/response';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss'
})
export class ProfileComponent {
  response!: response
  responseInit!: response

  name!: any

  profileFrom: FormGroup

  alertSuccess: boolean = false
  alertError: boolean = false

  arrInfo = signal<any>([])

  constructor(private services: ApiService, private router: Router) {
    this.profileFrom = new FormGroup({
      name: new FormControl("", [Validators.required]),
      birthdate: new FormControl("", [Validators.required]),
      location: new FormControl("", [Validators.required]),
      phone: new FormControl("", [Validators.required])
    });
  }

  async ngOnInit() {
    await this.informacion()
  }

  async informacion() {
    this.responseInit = await firstValueFrom(this.services.Informacion())

    if (this.responseInit.respuesta != "Error") {
      this.name = this.responseInit.respuesta.data.filter((object: { [x: string]: string; }) => {
        return object['type'] == "Nombre";
      })[0].value;

      this.arrInfo.set(this.responseInit.respuesta.data.filter((object: { [x: string]: string; }) => {
        return object['type'] != "Nombre";
      }))
    } else {
      this.alertError = true
      this.response = this.responseInit
    }
  }


  async onSubmitProfile() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.profileFrom.valid) {
      const formData = this.profileFrom.value;
      this.response = await firstValueFrom(this.services.EditarPerfil(formData))

      console.log(this.response)

      if (this.response.respuesta != "Error") {
        this.alertSuccess = true
        await this.informacion()
        this.profileFrom.reset()
      } else {
        this.alertError = true;
      }
    } else {
      this.alertError = true;
    }
  }

}
