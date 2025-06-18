import { Move } from '../entities/move.entity';

export interface MoveRepository {
    create(move: Partial<Move>): Promise<Move>;
    findByGameId(gameId: string): Promise<Move[]>;
}
