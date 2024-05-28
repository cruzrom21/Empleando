import { Injectable } from '@angular/core';
import { jwtDecode } from 'jwt-decode';

@Injectable({
  providedIn: 'root'
})
export class JwtService {

  constructor() { }

  isTokenExpired(token: string): boolean {
    if (!token) {
      return true;
    }

    const decodedToken: any = jwtDecode(token);
    const expirationDate = decodedToken.exp * 1000;
    const currentDate = Date.now();

    return currentDate > expirationDate;
  }

  rol(token: string): string {
    const decodedToken: any = jwtDecode(token);
    return !this.isTokenExpired(token) ? decodedToken.Rol : '0';
  }

}
