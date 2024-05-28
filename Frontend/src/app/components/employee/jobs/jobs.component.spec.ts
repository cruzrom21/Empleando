import { ComponentFixture, TestBed } from '@angular/core/testing';

import { JobsEmployeeComponent } from './jobs.component';

describe('JobsEmployeeComponent', () => {
  let component: JobsEmployeeComponent;
  let fixture: ComponentFixture<JobsEmployeeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [JobsEmployeeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(JobsEmployeeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
