import { Component, signal } from '@angular/core';
import { response } from '../../../core/models/response';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ApiService } from '../../../core/services/api.service';
import { Router } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './profile.component.html',
  styleUrl: './profile.component.scss'
})
export class ProfileEmployeeComponent {
  response!: response
  responseInit!: response
  responseSkills!: response
  name!: any

  experienceFrom: FormGroup
  eduFrom: FormGroup
  profileFrom: FormGroup

  alertSuccess: boolean = false
  alertError: boolean = false

  arrInfo = signal<any>([])
  arrEx = signal<any>([])
  arrEdu = signal<any>([])
  arrHab = signal<any>([])
  arrSkill = signal<any>([])

  constructor(private services: ApiService, private router: Router) {
    this.experienceFrom = new FormGroup({
      Cargo: new FormControl("", [Validators.required]),
      Company: new FormControl("", [Validators.required]),
      InitDate: new FormControl("", [Validators.required]),
      FinalDate: new FormControl(""),
      Description: new FormControl("", [Validators.required, Validators.maxLength(150)]),
    });

    this.eduFrom = new FormGroup({
      Titulo: new FormControl("", [Validators.required]),
      Institute: new FormControl("", [Validators.required]),
      InitDate: new FormControl("", [Validators.required]),
      FinalDate: new FormControl("")
    });

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

    this.responseSkills = await firstValueFrom(this.services.Habilidades())
    this.arrSkill.set(this.responseSkills.respuesta)

    console.log(this.responseSkills.respuesta)

    if (this.responseInit.respuesta != "Error") {
      this.name = this.responseInit.respuesta.data.filter((object: { [x: string]: string; }) => {
        return object['type'] == "Nombre";
      })[0].value;

      this.arrInfo.set(this.responseInit.respuesta.data.filter((object: { [x: string]: string; }) => {
        return object['type'] != "Nombre";
      }))

      this.arrEx.set(this.responseInit.respuesta.experiences)
      this.arrEdu.set(this.responseInit.respuesta.educations)
      this.arrHab.set(this.responseInit.respuesta.habilidades)

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

  async onSubmitEx() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.experienceFrom.valid) {
      const formData = this.experienceFrom.value;
      this.response = await firstValueFrom(this.services.CrearExperiencia(formData))

      if (this.response.respuesta != "Error") {
        this.alertSuccess = true;
        await this.informacion()
        this.experienceFrom.reset();
      } else {
        this.alertError = true;
      }
    } else {
      this.alertError = true;
    }
  }

  async onSubmitEdu() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.eduFrom.valid) {
      const formData = this.eduFrom.value;
      this.response = await firstValueFrom(this.services.CrearEducacion(formData))

      if (this.response.respuesta != "Error") {
        this.alertSuccess = true;
        await this.informacion()
        this.eduFrom.reset();
      } else {
        this.alertError = true;
      }
    } else {
      this.alertError = true;
    }
  }

  async CrearHabilidad(skill: string) {
    this.alertSuccess = false;
    this.alertError = false;

    this.response = await firstValueFrom(this.services.CrearHabilidad(skill))

    if (this.response.respuesta != "Error") {
      this.alertSuccess = true;
      await this.informacion()
      
    } else {
      this.alertError = true;
    }
  }

}
