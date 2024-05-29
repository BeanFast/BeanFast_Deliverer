import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '/models/exchange_gift.dart';
import '/enums/status_enum.dart';


class BannerExchangeGiftStatus extends StatelessWidget {
  final ExchangeGift exchangeGift;
  const BannerExchangeGiftStatus({super.key, required this.exchangeGift});

  @override
  Widget build(BuildContext context) {
    ExchangeGiftStatus status = ExchangeGiftStatus.fromInt(exchangeGift.status!);
    Text text = const Text('');
    Icon icon = const Icon(
      Iconsax.truck_fast,
      color: Colors.white,
      size: 90,
    );
    switch (status) {
      case ExchangeGiftStatus.preparing:
        {
          text = const Text(
            'Đơn hàng của bạn đang được chuẩn bị',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
          icon = const Icon(Iconsax.box_time, color: Colors.white, size: 60);
        }
        // color = Colors.grey[300]!;

        break;
      case ExchangeGiftStatus.delivering:
        {
          text = Text(
            'Đơn hàng sẽ được giao vào lúc ${DateFormat('hh:mm').format(exchangeGift.sessionDetail!.session!.deliveryStartTime!)} đến ${DateFormat('hh:mm dd/MM/yy').format(exchangeGift.sessionDetail!.session!.deliveryEndTime!)}. Vui lòng kiểm tra trước khi nhận hàng',
            style: const TextStyle(
              color: Colors.white,
            ),
          );
          icon = const Icon(
            Iconsax.truck_fast,
            color: Colors.white,
            size: 60,
          );
        }
        // color = Colors.grey[300]!;

        break;
      case ExchangeGiftStatus.completed:
        {
          text = const Text(
            'Cảm ơn bạn chọn BeanFast!',
            style: TextStyle(
              color: Colors.white,
            ),
          );
          icon = const Icon(Iconsax.box_tick, color: Colors.white, size: 60);
        }

        break;
      case ExchangeGiftStatus.cancelled:
        {
          text = const Text(
            'Đơn hàng đã bị huỷ. Vui lòng liên hệ với chúng tôi để biết thêm chi tiết.',
            style: TextStyle(
              color: Colors.white,
            ),
          );

          icon =
              const Icon(Iconsax.close_circle, color: Colors.white, size: 60);

          break;
        }

      default:
    }

    return Container(
      color: const Color.fromARGB(255, 106, 180, 108),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          SizedBox(
            width: 90,
            child: icon,
          )
        ],
      ),
    );
  }
}
