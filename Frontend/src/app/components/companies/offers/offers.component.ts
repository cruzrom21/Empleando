import { Component, ElementRef, ViewChild, signal } from '@angular/core';
import { response } from '../../../core/models/response';
import { Offer } from '../../../core/models/Offer';
import { ApiService } from '../../../core/services/api.service';
import { JwtService } from '../../../core/services/jwt.service';
import { firstValueFrom } from 'rxjs';
import { Router, RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-offers',
  standalone: true,
  imports: [CommonModule, RouterLink, ReactiveFormsModule],
  templateUrl: './offers.component.html',
  styleUrl: './offers.component.scss'
})
export class OffersComponent {
  response!: response
  responseInit!: response
  responseSkills!: response

  alertSuccess: boolean = false
  alertError: boolean = false

  token: string = localStorage.getItem('tokenEmpleando')!

  offerFrom: FormGroup
  arrOffer = signal<Offer[]>([])
  arrSkill = signal<any>([])

  @ViewChild('targetSection') targetSection!: ElementRef;

  constructor(private services: ApiService, private jwtServices: JwtService, private router: Router) {
    this.offerFrom = new FormGroup({
      Title: new FormControl("", [Validators.required]),
      Location: new FormControl("", [Validators.required]),
      TypeContract: new FormControl("", [Validators.required]),
      ExpirationDate: new FormControl("", [Validators.required]),
      Salary: new FormControl(""),
      Description: new FormControl("", [Validators.required, Validators.maxLength(150)]),
      habilidad: new FormControl("", [Validators.required, Validators.maxLength(150)])
    });

  }

  async ngOnInit() {
    await this.CargueInicial()
  }

  async CargueInicial() {
    this.alertError = false;

    if (!this.jwtServices.isTokenExpired(this.token)) {

      this.responseInit = await firstValueFrom(this.services.MisOfertas())

      this.responseSkills = await firstValueFrom(this.services.Habilidades())
      this.arrSkill.set(this.responseSkills.respuesta)

      if (this.responseInit.respuesta != "Error") {        
        

        if (this.responseInit.respuesta == "SinOfertas") {
          console.log(this.responseInit.respuesta)
          this.response = this.responseInit
          this.alertSuccess = true
        } else {
          this.arrOffer.set(this.responseInit.respuesta)
        }

      } else {
        this.alertError = true;
      }

    } else {
      this.router.navigate(['/login']);
    }
  }

  scrollToSection() {
    if (this.targetSection) {
      this.targetSection.nativeElement.scrollIntoView({ behavior: 'smooth' });
    }
  }

  async onSubmitEx() {
    this.alertSuccess = false;
    this.alertError = false;

    if (this.offerFrom.valid) {
      const formData = this.offerFrom.value;
      formData.Salary = formData.Salary.toString()

      console.log(formData)

      this.response = await firstValueFrom(this.services.CrearOferta(formData))

      if (this.response.respuesta != "Error") {
        
        this.alertSuccess = true;
        await this.CargueInicial()
        this.offerFrom.reset();

      } else {
        this.alertError = true;
      }

    } else {
      this.alertError = true;
    }
  }

}
