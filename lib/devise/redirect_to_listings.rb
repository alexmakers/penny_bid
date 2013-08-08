class RedirectToListings < Devise::FailureApp
  def redirect_url
    if warden_options[:scope] == :user
      listings_path
    else
      listings_path
    end
  end
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end