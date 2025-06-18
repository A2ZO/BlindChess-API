import { Game } from '../entities/game.entity';

export interface GameRepository {
     create(game: Partial<Game>): Promise<Game>;
     findById(id: string): Promise<Game | null>;
}
