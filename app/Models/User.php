<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;

class User  extends Authenticatable {
    use HasFactory, Notifiable, HasApiTokens;
    
    /**
    * @const int Constant indicating the administrator role
   */
   const ROL_ADMINISTRADOR = 1;

   /**
    * @const int Constant indicating the user role
   */
   const ROL_USER = 2;

   
    /**
     * @const int Constant representing the limit of characters that can be entered in the name
    */
    const MAX_LENGTH_NAME = 30;
   
    /**
     * @const int Constant representing the limit of characters that can be entered in the lastname
    */
    const MAX_LENGTH_LASTNAME = 30;

    /**
     * @const int Constant representing the limit of characters that can be entered in the password
    */
    const MAX_LENGTH_PASSWORD = 15;

    /**
     * @const int Constant representing the limit of characters that can be entered in the email
    */
    const MAX_LENGTH_EMAIL = 100;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'lastname',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];


    /**
     * Returns true if the user is an administrator
     * 
     * @return boolean
    */
    public function isAdministrador() {
        return $this->rol == User::ROL_ADMINISTRADOR;
    }

    /**
     * Retorna verdadero si el usuario es un directivo
     * 
     * @return boolean
    */
    public function isUser() {
        return $this->rol == User::ROL_USER;
    }
}
