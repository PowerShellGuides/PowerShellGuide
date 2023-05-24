@(
    if ($this.Metadata.coursename) {
        $this.Metadata.coursename -replace '[_-]', ' '
    }   
)