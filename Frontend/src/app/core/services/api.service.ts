import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { response } from '../models/response';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl: String

  constructor(private http: HttpClient) {
    this.apiUrl = 'https://localhost:44396'
  }

  InicioSesion(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    })

    return this.http
      .post<response>(`${this.apiUrl}/IniciarSesion`, fromValue, {
        headers: headers
      })
  }

  Register(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    })

    return this.http
      .post<response>(`${this.apiUrl}/Registrar`, fromValue, {
        headers: headers
      })
  }

  ListarEmpleos(): Observable<response> {
    return this.http
      .get<response>(`${this.apiUrl}/ListarEmpleos`)
  }

  ListarEmpresas(): Observable<response> {
    return this.http
      .get<response>(`${this.apiUrl}/ListarEmpresas`)
  }

  ListarEmpleosSesion(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/ListarEmpleosSesion`, httpOptions)
  }

  EmpleoDetalle(id: number): Observable<response> {
    return this.http
      .get<response>(`${this.apiUrl}/EmpleoDetalle/${id}`)
  }

  Aplicar(idOffer: number): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http.post<response>(`${this.apiUrl}/Aplicar/${idOffer}`, null, {
      headers: headers
    })
  }

  Buscar(clave: string): Observable<response> {
    return this.http
      .get<response>(`${this.apiUrl}/Buscar/${clave}`)
  }


  Informacion(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/Informacion`, httpOptions)
  }

  InformacionCandidato(userid: number): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/Informacion/${userid}`, httpOptions)
  }


  Habilidades(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/Habilidades`, httpOptions)
  }

  EditarPerfil(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http
      .post<response>(`${this.apiUrl}/EditarPerfil`, fromValue, {
        headers: headers
      })
  }

  CrearExperiencia(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http
      .post<response>(`${this.apiUrl}/CrearExperiencia`, fromValue, {
        headers: headers
      })
  }

  CrearEducacion(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http
      .post<response>(`${this.apiUrl}/CrearEducacion`, fromValue, {
        headers: headers
      })
  }

  CrearHabilidad(skill: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http
      .post<response>(`${this.apiUrl}/CrearHabilidad/${skill}`, null, {
        headers: headers
      })
  }

  Menu(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/Menu`, httpOptions)
  }


  MisOfertas(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/MisOfertas`, httpOptions)
  }

  CrearOferta(fromValue: any): Observable<response> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
    })

    return this.http
      .post<response>(`${this.apiUrl}/CrearOferta`, fromValue, {
        headers: headers
      })
  }

  ListarCandidatos(idOffer: number): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/ListarCandidatos/${idOffer}`, httpOptions)
  }

  EliminarOferta(idOffer: number): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .delete<response>(`${this.apiUrl}/EliminarOferta/${idOffer}`, httpOptions)
  }

  CandidatosRecomendados(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/CandidatosRecomendados`, httpOptions)
  }

  BuscarCandidato(clave: string): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/BuscarCandidato/${clave}`, httpOptions)
  }

  TieneData(): Observable<response> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': "Bearer " + localStorage.getItem('tokenEmpleando')
      })
    }

    return this.http
      .get<response>(`${this.apiUrl}/TieneData`, httpOptions)
  }

}
