<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run() {
        DB::table('users')->insert([
            'name' => 'Admin',
            'lastname' => 'Blog',
            'email' => 'admin@blog.com',
            'password' => '$2y$10$RTUHF4Bh2eiTqXvI7/bwDuMKRmzLNNFqfxVB1o/FdPvmmNgF/G7GS',
            'role' => 1
        ]);
        DB::table('users')->insert([
            'name' => 'User',
            'lastname' => 'Blog',
            'email' => 'user@blog.com',
            'password' => '$2y$10$RTUHF4Bh2eiTqXvI7/bwDuMKRmzLNNFqfxVB1o/FdPvmmNgF/G7GS'
        ]);
    }
}
