/**
 * Contrôleur Stimulus pour la barre latérale
 * 
 * Gère l'affichage et le masquage des sous-menus dans la barre latérale.
 * Permet également de garder ouvert le sous-menu de la page active.
 */
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]
  
  /**
   * Initialise le contrôleur lors de la connexion à l'élément DOM
   */
  connect() {
    console.log("Sidebar controller connected");
    
    // Masquer tous les sous-menus au chargement
    document.querySelectorAll('.submenu').forEach(submenu => {
      submenu.style.display = "none";
    });
    
    // Si une page active est dans un sous-menu, afficher ce sous-menu
    document.querySelectorAll('.submenu a.active').forEach(activeLink => {
      const parentSubmenu = activeLink.closest('.submenu');
      if (parentSubmenu) {
        parentSubmenu.style.display = "block";
        const parentLink = parentSubmenu.previousElementSibling;
        if (parentLink) {
          parentLink.classList.add('active-parent');
        }
      }
    });
    
    // Gérer l'affichage des sous-menus en mode réduit
    const sidebar = document.querySelector('.sidebar');
    const navItems = document.querySelectorAll('.nav-item-with-submenu');
    
    navItems.forEach(item => {
      const link = item.querySelector('a');
      const submenu = item.querySelector('.submenu');
      
      // Afficher le sous-menu au survol du lien en mode réduit
      link.addEventListener('mouseenter', () => {
        if (!sidebar.matches(':hover') && submenu) {
          submenu.style.display = 'block';
          
          // Positionner le sous-menu à côté de l'élément parent
          const linkRect = link.getBoundingClientRect();
          submenu.style.top = `${linkRect.top}px`;
        }
      });
      
      // Masquer le sous-menu quand la souris quitte le lien ou le sous-menu
      item.addEventListener('mouseleave', () => {
        if (!sidebar.matches(':hover') && submenu) {
          submenu.style.display = 'none';
        }
      });
    });
  }

  /**
   * Bascule l'affichage d'un sous-menu lorsqu'on clique sur son parent
   * @param {Event} event - L'événement de clic
   */
  toggleSubmenu(event) {
    event.preventDefault();
    const submenuId = event.currentTarget.dataset.sidebarSubmenuId;
    const submenu = document.getElementById(submenuId);
    const sidebar = document.querySelector('.sidebar');
    
    // Si la sidebar est en mode réduit, ne pas basculer le sous-menu au clic
    if (!sidebar.matches(':hover')) {
      return;
    }
    
    if (submenu) {
      if (submenu.style.display === "none" || submenu.style.display === "") {
        // Fermer tous les autres sous-menus d'abord
        document.querySelectorAll('.submenu').forEach(otherSubmenu => {
          if (otherSubmenu.id !== submenuId) {
            otherSubmenu.style.display = "none";
            const otherLink = otherSubmenu.previousElementSibling;
            if (otherLink) {
              otherLink.classList.remove('active-parent');
            }
          }
        });
        
        // Ouvrir ce sous-menu
        submenu.style.display = "block";
        event.currentTarget.classList.add('active-parent');
      } else {
        // Fermer ce sous-menu
        submenu.style.display = "none";
        event.currentTarget.classList.remove('active-parent');
      }
    }
  }
} 