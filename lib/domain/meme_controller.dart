import 'package:mytest/repository/meme_repo.dart';
import '../locator.dart';


class MemeDomainController {

  getNextMeme() async {

    return await locator.get<MemeRepo>().getMeme();
  }

}
