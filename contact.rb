class Contact
  attr_accessor :first_name, :last_name, :email, :note, :id
  @@contacts = []
  @@id = 1000

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  def self.all
    @@contacts
  end

  def self.find(contact_id)
    @@contacts.find{ |contact| contact.id == contact_id }
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
  end

  def self.display_a_contact
    puts "Enter the ID of the contact to display"
    contact_display_id = gets.to_i
    @@contacts.each do |contact|
      if contact.id == contact_display_id
        puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
      end
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def self.display_all
    @@contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note} #{contact.id}"
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

  def self.modify_contact
    modify_menu
    modify_user_selected = gets.to_i
    Contact.modify_call_option(modify_user_selected)
  end

  def self.modify_existing_contact
    puts "Enter user ID"
    @contact_modify_id = gets.to_i
    puts "Are you sure? y/n"
    confirmation = gets.chomp
    if confirmation == "y"
      Contact.modify_contact
    else
      return
    end
  end

  def self.modify_menu
    puts "[1] Change first name"
    puts "[2] Change last name"
    puts "[3] Change email address"
    puts "[4] Change note"
    puts "[5] Cancel"
    puts "Enter a number: "
  end

  def self.modify_call_option(modify_user_selected)
    change_first_name if modify_user_selected == 1
    change_last_name if modify_user_selected == 2
    change_email if modify_user_selected == 3
    change_note if modify_user_selected == 4
    return if modify_user_selected == 5
  end

  def self.change_first_name
    puts "Enter the new first name"
    new_first_name = gets.chomp
    @@contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.first_name = new_first_name
      end
    end
  end

  def self.change_last_name
    puts "Enter the new last name"
    new_last_name = gets.chomp
    @@contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.last_name = new_last_name
      end
    end
  end

  def self.change_email
    puts "Enter the new email"
    new_email = gets.chomp
    @@contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.email = new_email
      end
    end
  end

  def self.change_note
    puts "Enter new note"
    new_note = gets.chomp
    @@contacts.each do |contact|
      if contact.id == @contact_modify_id
        contact.note = new_note
      end
    end
  end

  def self.delete_contact(id)
    @@contacts.delete_if do |contact|
      contact.id == id
    end
  end

  def self.display_attribute
    puts "Enter the attribute to display for each contact"
    puts "first names, last names, emails, or notes"
    contact_attr = gets.chomp
    @@contacts.each do |contact|
      if contact_attr == "first names"
        puts contact.first_name
      elsif contact_attr == "last names"
        puts contact.last_name
      elsif contact_attr == "emails"
        puts contact.email
      elsif contact_attr == "notes"
        puts contact.notes
      end
    end
    puts "Press enter to continue"
    continue = gets
  end

end
