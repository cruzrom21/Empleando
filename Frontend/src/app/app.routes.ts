import { Routes } from '@angular/router';
import { LoginComponent } from './components/auth/login/login.component';
import { RegisterComponent } from './components/auth/register/register.component';
import { HomeEmployeeComponent } from './components/employee/home/home.component';
import { JobsEmployeeComponent } from './components/employee/jobs/jobs.component';
import { CompaniesEmployeeComponent } from './components/employee/companies/companies.component';
import { JobdesEmployeeComponent } from './components/employee/jobdes/jobdes.component';
import { ProfileEmployeeComponent } from './components/employee/profile/profile.component';
import { OffersComponent } from './components/companies/offers/offers.component';
import { OfferDesComponent } from './components/companies/offer-des/offer-des.component';
import { ProfileComponent } from './components/companies/profile/profile.component';
import { ProfilecanComponent } from './components/companies/profilecan/profilecan.component';
import { HomeComponent } from './components/companies/home/home.component';
import { CandidateComponent } from './components/companies/candidate/candidate.component';

export const routes: Routes = [
    {
        path: '',
        component: LoginComponent
    },
    {
        path: 'login',
        component: LoginComponent
    },
    {
        path: 'register',
        component: RegisterComponent
    },
    {
        path: 'employee/home',
        component: HomeEmployeeComponent
    },
    {
        path: 'employee/jobs/:clave',
        component: JobsEmployeeComponent
    },
    {
        path: 'employee/jobs',
        component: JobsEmployeeComponent
    },
    {
        path: 'employee/companies',
        component: CompaniesEmployeeComponent
    },
    {
        path: 'employee/profile',
        component: ProfileEmployeeComponent
    },
    {
        path: 'employee/jobdes/:id',
        component: JobdesEmployeeComponent
    },
    {
        path: 'companies/offers',
        component: OffersComponent
    },
    {
        path: 'companies/offersdes/:id',
        component: OfferDesComponent
    },
    {
        path: 'companies/profile',
        component: ProfileComponent
    },
    {
        path: 'companies/profilecan/:id',
        component: ProfilecanComponent
    },
    {
        path: 'companies/home',
        component: HomeComponent
    },
    {
        path: 'companies/candidate',
        component: CandidateComponent
    },
    {
        path: 'companies/candidate/:clave',
        component: CandidateComponent
    },
    {
        path: '**',
        component: LoginComponent
    }
];
