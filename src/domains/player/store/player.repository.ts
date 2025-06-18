import { Player } from '../entities/player.entity';

export interface PlayerRepository {
    create(player: Partial<Player>): Promise<Player>;
    findById(id: string): Promise<Player | null>;
    findByUsername(username: string): Promise<Player | null>;
}
