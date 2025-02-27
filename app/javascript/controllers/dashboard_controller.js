import { Controller } from "@hotwired/stimulus"

/**
 * Contrôleur Stimulus pour le tableau de bord
 * 
 * Gère les animations et interactions du tableau de bord principal,
 * notamment les effets de parallaxe et les animations au survol.
 */
export default class extends Controller {
  /**
   * Se connecte au contrôleur et initialise les fonctionnalités
   */
  connect() {
    console.log("Dashboard controller connected");
    this.initializeParallax();
    this.initializeHoverEffects();
  }

  /**
   * Redirige vers la page d'accueil du tableau de bord
   * @param {Event} event - L'événement de clic
   */
  home(event) {
    event.preventDefault();
    window.location.href = "/home";
  }

  /**
   * Initialise l'effet de parallaxe sur les cartes
   * Les cartes réagissent au mouvement de la souris pour créer un effet 3D
   */
  initializeParallax() {
    document.addEventListener('mousemove', (e) => {
      const cards = document.querySelectorAll('.action-card');
      const mouseX = e.clientX / window.innerWidth - 0.5;
      const mouseY = e.clientY / window.innerHeight - 0.5;

      cards.forEach(card => {
        const rect = card.getBoundingClientRect();
        const cardX = (rect.left + rect.width / 2) / window.innerWidth - 0.5;
        const cardY = (rect.top + rect.height / 2) / window.innerHeight - 0.5;

        const angle = Math.atan2(mouseY - cardY, mouseX - cardX);
        const distance = Math.sqrt(Math.pow(mouseX - cardX, 2) + Math.pow(mouseY - cardY, 2));
        
        card.style.transform = `
          perspective(1000px)
          rotateY(${distance * Math.cos(angle) * 5}deg)
          rotateX(${distance * Math.sin(angle) * -5}deg)
          translateZ(0)
        `;
      });
    });
  }

  /**
   * Initialise les effets de survol sur les cartes
   * Ajoute des animations subtiles lorsque l'utilisateur survole les cartes
   */
  initializeHoverEffects() {
    const cards = document.querySelectorAll('.action-card, .help-card');
    
    cards.forEach(card => {
      card.addEventListener('mouseenter', () => {
        card.style.transform = 'translateY(-4px)';
        card.style.boxShadow = '0 12px 30px rgba(0,0,0,0.08)';
      });

      card.addEventListener('mouseleave', () => {
        card.style.transform = 'translateY(0)';
        card.style.boxShadow = 'var(--card-shadow)';
      });
    });
  }
} 