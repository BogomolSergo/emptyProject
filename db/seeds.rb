user_list = [
    [ "John", "Lasser", "JHLas", "qwerty1234", "jhnlasser@gmail.com", "12.03.1971" ],
    [ "Micky", "Jankovsky", "janoks", "xxxxjnkxxx", "janovsky@i.com", "21.10.1965" ]
]

user_list.each do |first_name, last_name, username, password, email, birthday|
  User.create(first_name: first_name, last_name: last_name, username: username, password_hash: password, email: email, birthday: birthday )
end