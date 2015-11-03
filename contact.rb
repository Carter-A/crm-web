class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note

  @@contacts = []

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
  end

  def self.all
    @@contacts
  end
end
