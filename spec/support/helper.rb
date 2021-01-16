module Helpers
    def sign_in_as(user)
        user = User.create(name: "main-user",
                           email: "main-user@example.com",
                           password: "password",
                           password_confirmation: "password",
                           year: "1年",
                           bio: "hello!")
        visit user_path(user)
    end

end
  