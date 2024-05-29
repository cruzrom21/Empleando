using System;
using System.Collections.Generic;
using Datos.Models;
using Microsoft.EntityFrameworkCore;

namespace Datos;

public partial class DbEmpleandoContext : DbContext
{
    public DbEmpleandoContext()
    {
    }

    public DbEmpleandoContext(DbContextOptions<DbEmpleandoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Application> Applications { get; set; }

    public virtual DbSet<CompanyOffer> CompanyOffers { get; set; }

    public virtual DbSet<Education> Educations { get; set; }

    public virtual DbSet<Experience> Experiences { get; set; }

    public virtual DbSet<Offer> Offers { get; set; }

    public virtual DbSet<OfferSkill> OfferSkills { get; set; }

    public virtual DbSet<Skill> Skills { get; set; }

    public virtual DbSet<TypeDatum> TypeData { get; set; }

    public virtual DbSet<TypeUser> TypeUsers { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserSkill> UserSkills { get; set; }

    public virtual DbSet<UsersDatum> UsersData { get; set; }

    public DbSet<OfertasPorUsuario> OfertasPorUsuarios { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=Connection");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Application>(entity =>
        {
            entity.HasKey(e => e.IdAplications);

            entity.Property(e => e.ApplicationDate).HasColumnType("datetime");
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.ModifyDate).HasColumnType("datetime");

            entity.HasOne(d => d.IdOfferNavigation).WithMany(p => p.Applications)
                .HasForeignKey(d => d.IdOffer)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Applications_Offer");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Applications)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Applications_Users");
        });

        modelBuilder.Entity<CompanyOffer>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("CompanyOffers");

            entity.Property(e => e.Company)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ExpirationDate).HasColumnType("datetime");
            entity.Property(e => e.Location)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            entity.Property(e => e.Salary)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TypeContract)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Education>(entity =>
        {
            entity.HasKey(e => e.IdEducation);

            entity.ToTable("Education");

            entity.Property(e => e.FinalDate).HasColumnType("datetime");
            entity.Property(e => e.InitDate).HasColumnType("datetime");
            entity.Property(e => e.Institute)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdDataNavigation).WithMany(p => p.Educations)
                .HasForeignKey(d => d.IdData)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Education_UsersData");
        });

        modelBuilder.Entity<Experience>(entity =>
        {
            entity.HasKey(e => e.IdExperience);

            entity.ToTable("Experience");

            entity.Property(e => e.Company)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FinalDate).HasColumnType("datetime");
            entity.Property(e => e.InitDate).HasColumnType("datetime");

            entity.HasOne(d => d.IdDataNavigation).WithMany(p => p.Experiences)
                .HasForeignKey(d => d.IdData)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Experience_UsersData");
        });

        modelBuilder.Entity<Offer>(entity =>
        {
            entity.HasKey(e => e.IdOffer);

            entity.ToTable("Offer");

            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ExpirationDate).HasColumnType("datetime");
            entity.Property(e => e.Location)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            entity.Property(e => e.Salary)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TypeContract)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Offers)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Offer_Users");
        });

        modelBuilder.Entity<OfferSkill>(entity =>
        {
            entity.HasKey(e => e.IdOfferSkills);

            entity.HasOne(d => d.IdOfferNavigation).WithMany(p => p.OfferSkills)
                .HasForeignKey(d => d.IdOffer)
                .HasConstraintName("FK_OfferSkills_Offer");

            entity.HasOne(d => d.IdSkillsNavigation).WithMany(p => p.OfferSkills)
                .HasForeignKey(d => d.IdSkills)
                .HasConstraintName("FK_OfferSkills_Skills");
        });

        modelBuilder.Entity<Skill>(entity =>
        {
            entity.HasKey(e => e.IdSkills);

            entity.Property(e => e.Skill1)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Skill");
        });

        modelBuilder.Entity<TypeDatum>(entity =>
        {
            entity.HasKey(e => e.IdTypeData);

            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TypeUser>(entity =>
        {
            entity.HasKey(e => e.IdTypeUser);

            entity.ToTable("TypeUser");

            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser);

            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdTypeUserNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.IdTypeUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_TypeUser");
        });

        modelBuilder.Entity<UserSkill>(entity =>
        {
            entity.HasKey(e => e.IdUserSkills).HasName("PK_Table_1");

            entity.HasOne(d => d.IdSkillsNavigation).WithMany(p => p.UserSkills)
                .HasForeignKey(d => d.IdSkills)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserSkills_Skills");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.UserSkills)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserSkills_Users");
        });

        modelBuilder.Entity<UsersDatum>(entity =>
        {
            entity.HasKey(e => e.IdData);

            entity.Property(e => e.CreateDate).HasColumnType("datetime");
            entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            entity.Property(e => e.Value)
                .HasMaxLength(150)
                .IsUnicode(false);

            entity.HasOne(d => d.IdTypeDataNavigation).WithMany(p => p.UsersData)
                .HasForeignKey(d => d.IdTypeData)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UsersData_TypeData");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.UsersData)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UsersData_Users");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
