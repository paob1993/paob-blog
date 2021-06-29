<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publication extends Model {
    use HasFactory;
    
    /**
     * @const int Constant that represents the limit of characters that can be entered in the title
    */
    const MAX_LENGTH_TITLE = 200;    
    /**
     * @const int Constant that represents the limit of characters that can be entered in the author
    */
    const MAX_LENGTH_AUTHOR = 100;
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
    */
    protected $fillable = [
        'image',
        'title',
        'content',
        'date_publish',
        'author'
    ];

    public function interactions() {
        return $this->belongsToMany(User::class, 'interactions')->withPivot('visits', 'reaction');
    }

}
