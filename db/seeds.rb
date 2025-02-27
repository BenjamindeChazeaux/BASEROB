# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Création d'enregistrements pour le modèle Visit
puts "Creating visits..."

# Suppression des visites existantes pour éviter les doublons
Visit.destroy_all

# Définition des user agents
human_user_agents = [
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15",
  "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1",
  "Mozilla/5.0 (iPad; CPU OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36"
]

ai_bot_user_agents = [
  "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)",
  "ChatGPTBot/1.0",
  "Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)",
  "ClaudeBot/1.0",
  "BardBot/1.0 (Google AI Assistant)",
  "OpenAI-GPT-4-Crawler/1.0"
]

# Définition des chemins
paths = [
  "/",
  "/produits",
  "/produits/1",
  "/produits/2",
  "/produits/3",
  "/categories",
  "/contact",
  "/a-propos",
  "/blog",
  "/faq"
]

# Génération d'adresses IP aléatoires
def random_ip
  "#{rand(1..255)}.#{rand(0..255)}.#{rand(0..255)}.#{rand(1..255)}"
end

# Simulation de parcours humains (20 parcours)
20.times do
  # Chaque utilisateur a une adresse IP fixe et un user-agent fixe pour son parcours
  ip = random_ip
  user_agent = human_user_agents.sample
  
  # Simulation d'un parcours de 3 à 8 pages
  visited_paths = []
  rand(3..8).times do
    # Parfois l'utilisateur revient sur une page déjà visitée
    if visited_paths.any? && rand < 0.3
      path = visited_paths.sample
    else
      path = paths.sample
      visited_paths << path
    end
    
    Visit.create!(
      ip: ip,
      user_agent: user_agent,
      path: path,
      is_ai_bot: false,
      created_at: DateTime.now - rand(7).days - rand(24).hours - rand(60).minutes
    )
  end
end

# Simulation de visites de bots IA (10 parcours)
10.times do
  ip = random_ip
  user_agent = ai_bot_user_agents.sample
  
  # Les bots visitent généralement plus de pages
  rand(5..15).times do
    Visit.create!(
      ip: ip,
      user_agent: user_agent,
      path: paths.sample,
      is_ai_bot: true,
      created_at: DateTime.now - rand(7).days - rand(24).hours - rand(60).minutes
    )
  end
end

puts "Created #{Visit.count} visits!"
