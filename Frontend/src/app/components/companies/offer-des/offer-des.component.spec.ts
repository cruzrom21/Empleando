import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OfferDesComponent } from './offer-des.component';

describe('OfferDesComponent', () => {
  let component: OfferDesComponent;
  let fixture: ComponentFixture<OfferDesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [OfferDesComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(OfferDesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
