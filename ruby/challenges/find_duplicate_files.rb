def find_all_duplicate_files_from(path="/")
  directory_queue = []
  directory_queue.push path
  seen_hash = {}
  duplicates = []
  while directory_queue.any?
    path = directory_queue.shift
    Dir.foreach(path) do |file|
      if File.directory?(path+ "/" + file)
        directory_queue.push(path + "/" + file)
      else
        hash = hash_file(file)
        if seen_hash[hash]
          duplicates = pair_dups(seen_hash, file)
        else
          seen_hash[hash] << file
        end
      end
    end
  end
  duplicates
end

