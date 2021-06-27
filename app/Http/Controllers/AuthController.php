<?php

namespace App\Http\Controllers;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller {

    public function login(Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:'.User::MAX_LENGTH_EMAIL,
            'password' => 'required|string'
        ], [
            'email.required' => 'Debe ingresar el email.',
            'email.string' => 'El email debe ser de tipo texto.',
            'email.email' => 'Debe ingresra un email válido.',
            'email.max' => 'El email debe contener un máximo de :max caracteres.',
            'password.required' => 'Debe ingresar la contaseña.',
            'password.string' => 'La contraseña debe ser de tipo texto.'
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }

        $credentials = request(['email', 'password']);
        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'Correo o contraseña inválidos.'
            ], 401);
        };
        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');        
        $token = $tokenResult->token;
        $token->expires_at = Carbon::now()->addHour();
        $token->save();

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'user' => $user
        ], 200);
    }

    public function logout(Request $request) {
        $request->user()->token()->revoke();

        return response()->json([
            'message' => 'Su sesión se ha cerrado exitosamente'
        ], 200);

    }
}
