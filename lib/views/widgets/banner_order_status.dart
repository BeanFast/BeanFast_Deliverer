import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '/enums/status_enum.dart';
import '/models/order.dart';

class BannerOrderStatus extends StatelessWidget {
  final Order order;
  const BannerOrderStatus({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    OrderStatus status = OrderStatus.fromInt(order.status!);
    Text text = const Text('');
    Icon icon = const Icon(
      Iconsax.truck_fast,
      color: Colors.white,
      size: 90,
    );
    switch (status) {
      case OrderStatus.preparing:
        {
          text = const Text(
            'Đơn hàng đang được chuẩn bị',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
          icon = const Icon(Iconsax.box_time, color: Colors.white, size: 60);
        }
        // color = Colors.grey[300]!;

        break;
      case OrderStatus.cooking:
        {
          text = const Text(
            'Đơn hàng đang được chế biến',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
          icon = const Icon(Iconsax.box_time, color: Colors.white, size: 60);
        }
        // color = Colors.grey[300]!;

        break;
      case OrderStatus.delivering:
        {
          text = Text(
            'Đơn hàng sẽ giao vào lúc ${DateFormat('hh:mm').format(order.sessionDetail!.session!.deliveryStartTime!)} đến ${DateFormat('hh:mm dd/MM/yy').format(order.sessionDetail!.session!.deliveryEndTime!)}. Vui lòng kiểm tra trước khi giao hàng',
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
      case OrderStatus.completed:
        {
          text = const Text(
            'Đơn hàng đã được giao thành công',
            style: TextStyle(
              color: Colors.white,
            ),
          );
          icon = const Icon(Iconsax.box_tick, color: Colors.white, size: 60);
        }

        break;
      case OrderStatus.cancelled:
        {
          text = const Text(
            'Đơn hàng đã bị huỷ.',
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
