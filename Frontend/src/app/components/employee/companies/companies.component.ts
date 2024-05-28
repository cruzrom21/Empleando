import { Component, signal } from '@angular/core';
import { response } from '../../../core/models/response';
import { ApiService } from '../../../core/services/api.service';
import { firstValueFrom } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-companies',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './companies.component.html',
  styleUrl: './companies.component.scss'
})
export class CompaniesEmployeeComponent {
  response!: response
  alertError: boolean = false

  arrCom = signal<any>([])

  constructor(private services: ApiService) {
  }

  async ngOnInit() {
    this.alertError = false;

    this.response = await firstValueFrom(this.services.ListarEmpresas())

    if (this.response.respuesta != "Error") {
      const groupedData = this.response.respuesta.reduce((acc: { [x: string]: { [x: string]: any; }; }, item: { idUser: any; type: any; value: any; }) => {
        const { idUser, type, value } = item;

        if (!acc[idUser]) {
          acc[idUser] = { idUser, Nombre: '?', Ubicacion: '?', Telefono: '?' };
        }
        
        acc[idUser][type.trim()] = value;
        return acc;
      }, {});

      this.arrCom.set(Object.values(groupedData));

    } else {
      this.alertError = true;
    }
  }
}
