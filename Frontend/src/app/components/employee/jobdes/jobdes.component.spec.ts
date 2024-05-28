import { ComponentFixture, TestBed } from '@angular/core/testing';

import { JobdesEmployeeComponent } from './jobdes.component';

describe('JobdesEmployeeComponent', () => {
  let component: JobdesEmployeeComponent;
  let fixture: ComponentFixture<JobdesEmployeeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [JobdesEmployeeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(JobdesEmployeeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
