﻿#pragma checksum "..\..\..\écrans\menuPrincipal.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "C6F4B68F971BD2BE0098645F45B0EA4B"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Combaxe___New.écrans {
    
    
    /// <summary>
    /// menuPrincipal
    /// </summary>
    public partial class menuPrincipal : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 29 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnCombat;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnInventaire;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnStatistiques;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnSupprimerPerso;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnChangerPerso;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnDeconnexion;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnCampagne;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\écrans\menuPrincipal.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnPartieRapide;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Combaxe - New;component/%c3%a9crans/menuprincipal.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\écrans\menuPrincipal.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.btnCombat = ((System.Windows.Controls.Button)(target));
            
            #line 29 "..\..\..\écrans\menuPrincipal.xaml"
            this.btnCombat.Click += new System.Windows.RoutedEventHandler(this.btnCombat_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.btnInventaire = ((System.Windows.Controls.Button)(target));
            return;
            case 3:
            this.btnStatistiques = ((System.Windows.Controls.Button)(target));
            return;
            case 4:
            this.btnSupprimerPerso = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\écrans\menuPrincipal.xaml"
            this.btnSupprimerPerso.Click += new System.Windows.RoutedEventHandler(this.btnSupprimerPerso_Click_1);
            
            #line default
            #line hidden
            return;
            case 5:
            this.btnChangerPerso = ((System.Windows.Controls.Button)(target));
            return;
            case 6:
            this.btnDeconnexion = ((System.Windows.Controls.Button)(target));
            return;
            case 7:
            this.btnCampagne = ((System.Windows.Controls.Button)(target));
            return;
            case 8:
            this.btnPartieRapide = ((System.Windows.Controls.Button)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

