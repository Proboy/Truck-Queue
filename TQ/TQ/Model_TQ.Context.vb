﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Data.Entity
Imports System.Data.Entity.Infrastructure

Partial Public Class Entities_ConnStr
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=Entities_ConnStr")
    End Sub

    Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
        Throw New UnintentionalCodeFirstException()
    End Sub

    Public Overridable Property TQ_MS_TERMINAL() As DbSet(Of TQ_MS_TERMINAL)
    Public Overridable Property TQ_RN_RUNNUMBER() As DbSet(Of TQ_RN_RUNNUMBER)
    Public Overridable Property TQ_MS_TYPEWORK() As DbSet(Of TQ_MS_TYPEWORK)
    Public Overridable Property TQ_TR_QUOTA() As DbSet(Of TQ_TR_QUOTA)
    Public Overridable Property TQ_TRUCK_VISIT_HIS() As DbSet(Of TQ_TRUCK_VISIT_HIS)
    Public Overridable Property TQ_MS_TRUCK_COMP() As DbSet(Of TQ_MS_TRUCK_COMP)
    Public Overridable Property TQ_MS_DRIVER_INFO() As DbSet(Of TQ_MS_DRIVER_INFO)
    Public Overridable Property TQ_MS_TRUCK_INFO() As DbSet(Of TQ_MS_TRUCK_INFO)

End Class