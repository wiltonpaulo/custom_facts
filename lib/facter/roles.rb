# ([a-z]+[-]+[a-z]+), i.e. www-dd-ee-ff or logger-dd-ee-ff have a puppet_role of www-dd-ee-ff or logger-dd-ee-ff
if Facter.value(:hostname) =~ /^([a-z]+[-]+[a-z]+[-]+[a-z]+[-]+[a-z]+)/
  Facter.add('puppet_role') do
    setcode do
      $1
    end
  end
# ([a-z]+[-]+[a-z]+), i.e. www-ddd-eee or logger-ddd-eee have a puppet_role of www-ddd-eee or logger-ddd-eee
elsif Facter.value(:hostname) =~ /^([a-z]+[-]+[a-z]+[-]+[a-z]+)/
  Facter.add('puppet_role') do
    setcode do
      $1
    end
  end
# ([a-z]+[-]+[a-z]+), i.e. www-ddd or logger-ddd have a puppet_role of www-ddd or logger-ddd
elsif Facter.value(:hostname) =~ /^([a-z]+[-]+[a-z]+)/
  Facter.add('puppet_role') do
    setcode do
      $1
    end
  end
# ([a-z]+)[0-9]+, i.e. server-01 or logger-22 have a puppet_role of server or logger
elsif Facter.value(:hostname) =~ /^([a-z]+)-[0-9]+$/
  Facter.add('puppet_role') do
    setcode do
      $1
    end
  end
# ([a-z]+), i.e. www or logger have a puppet_role of www or logger
elsif Facter.value(:hostname) =~ /^([a-z]+)$/
  Facter.add('puppet_role') do
    setcode do
      $1
    end
  end
# Set to hostname if no patterns match
else
  Facter.add('puppet_role') do
    setcode do
      'default'
    end
  end
end
