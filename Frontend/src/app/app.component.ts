import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { MenuComponent } from './components/general/menu/menu.component';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterModule, MenuComponent, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'Empleo';

  constructor(private router: Router) { }

  showGeneral(): boolean {
    const url = this.router.url;

    if (url.includes('/login') || url === '/' || url.includes('/register')){
      return false;
    } 

    return true;
    
  }
}
