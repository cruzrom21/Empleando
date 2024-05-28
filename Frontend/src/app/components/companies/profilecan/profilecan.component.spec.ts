import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilecanComponent } from './profilecan.component';

describe('ProfilecanComponent', () => {
  let component: ProfilecanComponent;
  let fixture: ComponentFixture<ProfilecanComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProfilecanComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ProfilecanComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
