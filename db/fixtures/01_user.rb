User.seed(:id,
  { id: 1, name: "user1", profile: "user1です。", email: "user1@example.com", password: "password1", role: :administer },
  { id: 2, name: "user2", profile: "user2です。", email: "user2@example.com", password: "password2", role: :general }
)