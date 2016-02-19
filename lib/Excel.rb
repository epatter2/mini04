class Excel
  Alph = ("A".."Z").to_a
  def alph(potato)
    s = ""
    until (potato.to_i == 0)
      potato, r = (potato.to_i - 1).divmod(26)
      s.prepend(Alph[r])
    end
    return s
  end
end