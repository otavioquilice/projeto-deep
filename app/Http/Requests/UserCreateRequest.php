<?php

namespace App\Http\Requests;
use App\Models\User;
use Illuminate\Validation\Rules;

use Illuminate\Foundation\Http\FormRequest;

class UserCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'email' => [
                'required', 
                'max:255',
                'lowercase', 
                'email', 
                'max:255', 
                'unique:'.User::class
            ],
            'password' => [
                'required', 
                'confirmed', 
                Rules\Password::defaults()
            ],
            'name' => [
                'required', 
                'string', 
                'max:255'
            ]
        ];
    }
}
