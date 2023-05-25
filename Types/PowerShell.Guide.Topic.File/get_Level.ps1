@(
    if ($this.Metadata.level) {
        $this.Metadata.level -replace '[_-]', ' '
    }   
)