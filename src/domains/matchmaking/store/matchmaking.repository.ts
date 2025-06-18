import { Matchmaking } from '../entities/matchmaking.entity';

export interface MatchmakingRepository {
    create(match: Partial<Matchmaking>): Promise<Matchmaking>;
    findWaitingPlayer(): Promise<Matchmaking | null>;
    matchPlayers(player1Id: string, player2Id: string): Promise<Matchmaking>;
}
