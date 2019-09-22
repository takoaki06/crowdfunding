User.seed(:id,
  { id: 1, name: "user1", profile: "user1です。", email: "user1@example.com", password: "password1", role: :administer },
  { id: 2, name: "guest", profile: "guestです。", email: "guest@example.com", password: "guestpassword", role: :general }
)