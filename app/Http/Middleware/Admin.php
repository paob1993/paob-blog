<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next) {
        if ($request->user()->isAdministrador()) {
            return $next($request);
        }
        return response()->json(['message' => 'Usuario no autorizado'], 401);
    }
}
