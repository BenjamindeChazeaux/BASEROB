module IconHelper
  # Génère une icône FontAwesome avec des options personnalisées
  #
  # @param name [String] Nom de l'icône (sans le préfixe fa-)
  # @param options [Hash] Options supplémentaires pour l'icône
  # @option options [String] :class Classes CSS supplémentaires
  # @option options [String] :text Texte à afficher à côté de l'icône
  # @option options [Boolean] :fixed_width Utiliser une largeur fixe
  #
  # @return [String] Balise HTML de l'icône
  def icon(name, options = {})
    classes = ["fas", "fa-#{name}"]
    classes << "fa-fw" if options[:fixed_width]
    classes << options[:class] if options[:class].present?
    
    icon_tag = content_tag(:i, nil, class: classes.join(" "))
    
    if options[:text].present?
      icon_tag + content_tag(:span, options[:text], class: "icon-text")
    else
      icon_tag
    end
  end
end 