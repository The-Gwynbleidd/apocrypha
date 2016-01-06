unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "draganjeremic01@gmail.com", password: "12345678",
  admin: true)
end
