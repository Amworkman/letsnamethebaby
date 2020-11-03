Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "663216805974-qqptrdk9b8ncf0r5mfqunq6h7adsamvh.apps.googleusercontent.com", "yL5izmmttzrKrGlMfh1KHo0S"
  end