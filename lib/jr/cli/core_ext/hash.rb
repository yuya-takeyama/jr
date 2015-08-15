class Hash
  def method_missing(method_name, *args)
    return self[method_name] if key? method_name
    name, suffix = split_name_and_suffix(method_name)
    case suffix
    when '?'
      !!self[name.to_sym]
    when '='
      self[name.to_sym] = args[0]
    else
      self[name.to_sym]
    end
  end

  private
  METHOD_SPLITTER = /(.*?)([\?=]?)$/

  def split_name_and_suffix(method_name)
    match = method_name.to_s.match(METHOD_SPLITTER)
    [match[1], match[2]]
  end
end
